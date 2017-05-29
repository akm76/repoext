# Generate manifests for projects (one time?)
$d=@{
    project = "shark-ml";
    homepage = "http://image.diku.dk/shark/sphinx_pages/build/html/index.html";
    scs = "git";
    cloneurl = "git clone https://github.com/Shark-ML/Shark/";
    lang = "c++";
    depends = "boost","cmake";
    updatecmd = "git pull";
    buildcmd = "";
    #buildscript = "";
    description = "SHARK is a fast, modular, feature-rich open-source C++ machine learning library. It provides methods for linear and nonlinear optimization, kernel-based learning algorithms, neural networks, and various other machine learning techniques"
    }
If( -Not (Test-Path .\projects\modular-boost)) { mkdir .\projects\shark-ml }
ConvertTo-Json $d |Set-Content .\projects\shark-ml\manifest.json

$d=@{
    project = "modular-boost";
    homepage = "http://www.boost.org";
    scs = "git";
    lang = "c++";
    cloneurl = "git clone --recursive git@github.com:boostorg/boost.git";
    updatecmd = "git checkout master","git pull","git submodule update --init";
    #buildcmd = "";
    buildscript = "files/build.ps1"
    description = "Boost provides free peer-reviewed portable C++ source libraries.

We emphasize libraries that work well with the C++ Standard Library. Boost libraries are intended to be widely useful, and usable across a broad spectrum of applications."
}
If( -Not (Test-Path .\projects\modular-boost)) { mkdir .\projects\modular-boost }
ConvertTo-Json $d |Set-Content .\projects\modular-boost\manifest.json