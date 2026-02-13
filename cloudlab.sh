DEVICE=$1

sudo fdisk ${DEVICE} <<EOF
n
p
1


w
q
EOF

sudo mkfs.ext4 ${DEVICE}1

UUID=$(sudo blkid | awk -v dev="${DEVICE}1:" '$1 == dev {print $2}' | sed -n 's/.*"\(.*\)\".*/\1/p')

mkdir Code

echo "/dev/disk/by-uuid/${UUID} /users/tewaro/Code ext4 defaults 0 1" | sudo tee -a /etc/fstab

sudo systemctl daemon-reload
sudo mount -a

sudo chown tewaro ~/Code


sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
