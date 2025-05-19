#!/bin/bash


sep=" ==== "

fancify() {
    return $sep$1$sep
}


done=$(fancify("done!"))

echo $(fancify("starting cleanup"))
echo $(fancify("updating packages..."))
sudo dnf upgrade --refresh -y
echo $done

echo $(fancify("removing unused/orphaned packages..."))
sudo dnf autoremove -y
echo $done

echo $(fancify("cleaning up cache..."))
sudo dnf clean all
echo $done


echo $(fancify("Cleaning cache after a system upgrade"))
sudo dnf system-upgrade clean
echo $done

echo $(fancify("Cleaning /tmp and KDE cache..."))
sudo rm -rf /tmp/*
rm -rf ~/.cache/*
echo $done

echo $(fancify("Removing old versions of Flatpak apps..."))
flatpak uninstall --unused
echo $done

echo $(fancify("Running Flatpak repair to clean up caches and orphaned files..."))
flatpak repair
echo $done

# OPTIONAL - Uncomment lines below if flatpack cache needs to be cleared
echo $(fancify("Clearing Flatpak download cache..."))
sudo rm -rf /var/tmp/flatpak-cache-*
echo $done

echo $(fancify("Cleaning up journal logs, keeping the last week..."))
sudo journalctl --vacuum-time=1m
echo $done

echo $(fancify("Removing broken symlinks..."))
find ~ -xtype l -delete
echo $done

echo $(fancify("Cleanup Completed!"))
