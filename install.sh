uname="$(uname -s)"

case "${uname}" in
    Linux*)  machine=linux;;
    Darwin*) machine=macosx;;
    CYGWIN*) machine=windows;;
    MINGW*)  machine=windows;;

    *)
        machine="UNKNOWN:${uname}"
        echo "Cannot install for ${machine}"
        exit
        ;;

esac

echo "Detected OS ${machine}"

#machine="macosx"

case "${machine}" in

"windows")
    mkdir -p bin/win-x32

    cd bin/win-x32

    # sciter 4.4.8.15
    curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/windows/x32/scapp.exe
    curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/windows/x32/inspector.exe
    curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/windows/x32/sciter.dll
    ;;

"linux")
    mkdir -p bin/linux

    cd bin/linux

    curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/linux/x64/scapp
    curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/linux/x64/inspector
    curl -LO https://github.com/c-smile/sciter-js-sdk/raw/faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/linux/x64/libsciter-gtk.so

    # make binaries executable
    chmod +x scapp inspector libsciter-gtk.so
    ;;

"macosx")
    # download the whole archive because of inspector.app which is a directory
    curl -LO https://github.com/c-smile/sciter-js-sdk/archive/faeba319c38bac2e833cbf0fe5a6be60cf87a24e.zip

    # unzip binaries
    unzip faeba319c38bac2e833cbf0fe5a6be60cf87a24e.zip sciter-js-sdk-faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin/${machine}/* -d .

    # move binaries
    mv sciter-js-sdk-faeba319c38bac2e833cbf0fe5a6be60cf87a24e/bin .

    # delete old dir
    rmdir sciter-js-sdk-faeba319c38bac2e833cbf0fe5a6be60cf87a24e

    # delete zip
    rm faeba319c38bac2e833cbf0fe5a6be60cf87a24e.zip

    cd bin/${machine}

    # make binaries executable
    chmod +x scapp inspector.app libsciter.dylib
    ;;

esac

cd ..

# sciter package manager 0.2.2
curl -LO https://github.com/8ctopus/sciter-package-manager/releases/download/0.2.2/spm.phar
