If you have a ten-page contract with a signature page on page 10,
and sign the last page and scan it,
and you don't want to scan the other nine pages too:

    pdftk A=contract.pdf B=signature.pdf cat A1-9 B output signed-contract.pdf

Btw pdftk on Ubuntu 18.04 and later is broken. It gets installed as a snap so it can't see certain files (e.g. files outside your home directory, even if symlinked to there, seem to be a problem). This way of installing works though:

https://askubuntu.com/a/1046476/70692

And to record it for posterity:

```
#!/bin/bash
#
# author: abu
# date:   July 3 2019 (ver. 1.1)
# description: bash script to install pdftk on Ubuntu 18.04 for amd64 machines
##############################################################################
#
# change to /tmp directory
cd /tmp
# download packages
wget http://launchpadlibrarian.net/340410966/libgcj17_6.4.0-8ubuntu1_amd64.deb \
 http://launchpadlibrarian.net/337429932/libgcj-common_6.4-3ubuntu1_all.deb \
 https://launchpad.net/ubuntu/+source/pdftk/2.02-4build1/+build/10581759/+files/pdftk_2.02-4build1_amd64.deb \
 https://launchpad.net/ubuntu/+source/pdftk/2.02-4build1/+build/10581759/+files/pdftk-dbg_2.02-4build1_amd64.deb


echo -e "Packages for pdftk downloaded\n\n"
# install packages
echo -e "\n\n Installing pdftk: \n\n"
sudo apt-get install ./libgcj17_6.4.0-8ubuntu1_amd64.deb \
    ./libgcj-common_6.4-3ubuntu1_all.deb \
    ./pdftk_2.02-4build1_amd64.deb \
    ./pdftk-dbg_2.02-4build1_amd64.deb
echo -e "\n\n pdftk installed\n"
echo -e "   try it in shell with: > pdftk \n"
# delete deb files in /tmp directory
rm ./libgcj17_6.4.0-8ubuntu1_amd64.deb
rm ./libgcj-common_6.4-3ubuntu1_all.deb
rm ./pdftk_2.02-4build1_amd64.deb
rm ./pdftk-dbg_2.02-4build1_amd64.deb
```

On a Mac, use poppler instead:

```
pdfseparate the-file.pdf 'p%d.pdf'
pdfunite p{1,2,3}.pdf signature-page.pdf the-file-signed.pdf
```

or with automatic page counting:

```
pdfseparate the-file.pdf 'p%d.pdf'
pdfunite p{1..$(pdfinfo the-file.pdf | grep Pages | cut -d: -f2 | xargs)}.pdf signature-page.pdf the-file-signed.pdf
```

Or you can use Preview if you really have to: print-to-pdf the pages you want,
then use Edit > Insert > Page from File... to add another.
