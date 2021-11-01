mkdir bin\win-x32

cd bin\win-x32

REM sciter 4.4.8.15
curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/windows/x32/scapp.exe
curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/windows/x32/inspector.exe
curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/windows/x32/sciter.dll

cd ..

REM sciter package manager 0.2.1
curl -LO https://github.com/8ctopus/sciter-package-manager/releases/download/0.2.1/spm.phar

pause
