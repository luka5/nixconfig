# Installing NixOS

1. Switch to use root
```
sudo --shell
```

2. Install git
```
nix-env --install git
```

3. Prepare Filesystem
```
parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
parted /dev/nvme0n1 -- set 1 boot on
parted /dev/nvme0n1 -- mkpart primary 512MiB 100%

mkfs.fat -F 32 -n BOOT /dev/nvme0n1p1

cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup luksOpen /dev/nvme0n1p2 crypted
mkfs.ext4 -L nixos /dev/mapper/crypted
```

4. Mount Filesystem

```
mount /dev/mapper/crypted /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```

5. Generate NixOS Config
```
nixos-generate-config --root /mnt
```

6. Customize Config
```
mv /mnt/etc/nixos /mnt/etc/nixos-default
git clone https://github.com/luka5/nixconfig /mnt/etc/nixos/
```
Manually check cloned and automatically created files in `/mnt/etc/nixos/`.

7. Install it!
```
nixos-install
```
