# download sciter 4.4.8.15
curl -LO https://github.com/c-smile/sciter-js-sdk/archive/faeba319c38bac2e833cbf0fe5a6be60cf87a24e.zip

# unzip binaries
unzip faeba319c38bac2e833cbf0fe5a6be60cf87a24e.zip sciter-js-sdk-faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/macosx/* -d .

# move binaries
mv sciter-js-sdk-faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin .

# delete old dir
rmdir sciter-js-sdk-faeba319c38bac2e833cbf0fe5a6be60cf87a24e

# delete zip
rm faeba319c38bac2e833cbf0fe5a6be60cf87a24e.zip

cd bin/macosx

# make binaries executable
chmod +x scapp inspector.app libsciter.dylib

cd ..

# sciter package manager 0.2.1
curl -LO https://github.com/8ctopus/sciter-package-manager/releases/download/0.2.1/spm.phar
