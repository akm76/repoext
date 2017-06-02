# Generate manifests for projects (one time?)
# execute from repoext dir
$d=
@{
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

$d=
@{
    project = "modular-boost";
    homepage = "http://www.boost.org";
    scs = "git";
    lang = "c++";
    cloneurl = "git clone --recursive git@github.com:boostorg/boost.git";
    updatecmd = "git checkout master","git pull","git submodule update --init";
    #buildcmd = "";
    buildscript = "files/build.ps1","files/build.sh"
    description = "Boost provides free peer-reviewed portable C++ source libraries.

We emphasize libraries that work well with the C++ Standard Library. Boost libraries are intended to be widely useful, and usable across a broad spectrum of applications."
}
If( -Not (Test-Path .\projects\modular-boost)) { mkdir .\projects\modular-boost }
ConvertTo-Json $d |Set-Content .\projects\modular-boost\manifest.json

$d=
@{
    project = "cmake";
    homepage = "http://www.cmake.org";
    scs = "git";
    lang = "c++";
    cloneurl = "git clone https://cmake.org/cmake.git";
    updatecmd = "git pull";
    buildcmd = "";
    description = "CMake is an open-source, cross-platform family of tools designed to build, test and package software. CMake is used to control the software compilation process using simple platform and compiler independent configuration files, and generate native makefiles and workspaces that can be used in the compiler environment of your choice."
}
If( -Not (Test-Path .\projects\cmake)) { mkdir .\projects\cmake }
ConvertTo-Json $d |Set-Content .\projects\cmake\manifest.json

$d=
@{
    project = "llvm-project";
    homepage = "http://clang.llvm.org/get_started.html";
    scs = "git";
    lang = "c++";
    cloneurl = "git clone https://github.com/llvm-project/llvm-project-20170507/";
    updatecmd = "git pull";
    depends = "cmake";
    buildcmd = "";
    description = "The LLVM Project is a collection of modular and reusable compiler and toolchain technologies. Despite its name, LLVM has little to do with traditional virtual machines, though it does provide helpful libraries that can be used to build them."
    note = "This is experimental git mono-repo; main project uses svn; check out clang-llvm"
}
If( -Not (Test-Path .\projects\llvm-project)) { mkdir .\projects\llvm-project }
ConvertTo-Json $d |Set-Content .\projects\llvm-project\manifest.json

$d=
@{
    project = "clang-llvm";
    homepage = "http://clang.llvm.org/get_started.html";
    scs = "svn";
    lang = "c++";
    cloneurl = "";
    clonescript = "svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm; cd llvm/tools; svn co http://llvm.org/svn/llvm-project/cfe/trunk clang";
    updatecmd = "";
    depends = "cmake";
    buildcmd = "mkdir build; cd build; cmake -G `"Visual Studio 14 2015 Win64`" ../llvm; cmake --build ../ --config Release";
    description = "The LLVM Project is a collection of modular and reusable compiler and toolchain technologies. Despite its name, LLVM has little to do with traditional virtual machines, though it does provide helpful libraries that can be used to build them."
}
If( -Not (Test-Path .\projects\clang-llvm)) { mkdir .\projects\clang-llvm }
ConvertTo-Json $d |Set-Content .\projects\clang-llvm\manifest.json

$d=
@{
    project = "clam-project";
    homepage = "http://clam-project.org/index.html";
    scs = "svn";
    lang = "c++";
    cloneurl = "";
    clonescript = "svn co http://clam-project.org/clam/trunk clam";
    updatecmd = "";
    buildcmd = "";
    description = "CLAM (C++ Library for Audio and Music) is a full-fledged software framework for research and application development in the Audio and Music Domain. It offers a conceptual model as well as tools for the analysis, synthesis and processing of audio signals."
}
If( -Not (Test-Path .\projects\clam-project)) { mkdir .\projects\clam-project }
ConvertTo-Json $d |Set-Content .\projects\clam-project\manifest.json

$d=
@{
    project = "deedle-lib";
    homepage = "";
    scs = "git";
    cloneurl = "git clone https://github.com/BlueMountainCapital/Deedle.git";
    lang="c-sharp","f-sharp";
    updatecmd = "git pull";
    buildcmd = "";
    description = "";
}
If( -Not (Test-Path .\projects\deedle-lib)) { mkdir .\projects\deedle-lib }
ConvertTo-Json $d |Set-Content .\projects\deedle-lib\manifest.json

$d=
@{
    project = "dlib-ml";
    homepage = "http://dlib.net";
    devhome = "https://github.com/davisking/dlib";
    scs = "git";
    cloneurl = "git clone https://github.com/davisking/dlib.git";
    lang = "c++","python";
    updatecmd = "";
    buildcmd = "";
    description = "Dlib is a modern C++ toolkit containing machine learning algorithms and tools for creating complex software in C++ to solve real world problems.";
}
If( -Not (Test-Path .\projects\dlib-ml)) { mkdir .\projects\dlib-ml }
ConvertTo-Json $d |Set-Content .\projects\dlib-ml\manifest.json

$d=
@{
    project = "eigen-lib";
    homepage = "http://eigen.tuxfamily.org/index.php?title=Main_Page"
    scs = "hg";
    cloneurl = "hg clone https://bitbucket.org/eigen/eigen/";
    lang = "c++";
    updatecmd = "";
    buildcmd = "";
    description = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
}
If( -Not (Test-Path .\projects\eigen-lib)) { mkdir .\projects\eigen-lib }
ConvertTo-Json $d |Set-Content .\projects\eigen-lib\manifest.json

$d=
@{
    project="fastdb";
    homepage = "http://www.garret.ru/fastdb.html";
    scs = "svn"
    cloneurl="";
    clonescript="svn checkout svn://svn.code.sf.net/p/fastdb/code/ fastdb-code";
    lang="c";
    updatecmd="";
    buildcmd="";
    description = "Main Memory Relational Database Management System."
}
If( -Not (Test-Path .\projects\fastdb)) { mkdir .\projects\fastdb }
ConvertTo-Json $d |Set-Content .\projects\fastdb\manifest.json

$d=
@{
    project = "flatbuffers";
    homepage = "http://google.github.io/flatbuffers/";
    scs = "git";
    cloneurl="git clone https://github.com/google/flatbuffers.git";
    lang="c++", "c-sharp", "c", "Go", "Java", "JavaScript", "PHP", "Python";
    updatecmd = "git pull";
    buildcmd="";
    description = "FlatBuffers is an efficient cross platform serialization library for C++, C#, C, Go, Java, JavaScript, PHP, and Python."
}
If( -Not (Test-Path .\projects\flatbuffers)) { mkdir .\projects\flatbuffers }
ConvertTo-Json $d |Set-Content .\projects\flatbuffers\manifest.json

$d=@{
    project = "folly-lib";
    homepage = "https://github.com/facebook/folly";
    scs = "git";
    cloneurl = "git clone https://github.com/facebook/folly.git";
    lang = "c++";
    updatecmd = "git pull";
    buildcmd = "";
    description = "Folly (acronymed loosely after Facebook Open Source Library) is a library of C++11 components designed with practicality and efficiency in mind. Folly contains a variety of core library components used extensively at Facebook. In particular, it's often a dependency of Facebook's other open source C++ efforts and place where those projects can share code.";
    note="Facebook's library of general purpose c++ code; extensions to std and boost"
}
If( -Not (Test-Path .\projects\folly-lib)) { mkdir .\projects\folly-lib }
ConvertTo-Json $d |Set-Content .\projects\folly-lib\manifest.json

$d=@{
    project = "gsl-lib";
    homepage = "https://www.gnu.org/software/gsl/";
    scs = "git";
    cloneurl = "git clone git://git.savannah.gnu.org/gsl.git";
    lang = "c";
    updatecmd = "git pull";
    buildcmd = "";
    description = "The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers.";
}
If( -Not (Test-Path .\projects\gsl-lib)) { mkdir .\projects\gsl-lib }
ConvertTo-Json $d |Set-Content .\projects\gsl-lib\manifest.json

$d=@{
    project = "cinder-lib";
    homepage = "https://www.libcinder.org";
    devhome = "https://github.com/cinder/Cinder";
    scs = "git";
    cloneurl = "git clone --recursive https://github.com/cinder/Cinder.git";
    lang = "c++";
    updatecmd = "";
    buildcmd = "";
    description = "Cinder is a free and open source library for professional-quality creative coding in C++.";
}
If( -Not (Test-Path .\projects\cinder-lib)) { mkdir .\projects\cinder-lib }
ConvertTo-Json $d |Set-Content .\projects\cinder-lib\manifest.json

$d=@{
    project = "libdynd";
    homepage = "http://libdynd.org/";
    devhome = "https://github.com/libdynd/libdynd";
    scs = "git";
    cloneurl = "git clone https://github.com/libdynd/libdynd.git";
    updatecmd = "git pull";
    buildcmd = "";
    lang = "c++","python";
    description = "DyND is a dynamic array library for structured and semi-structured data, written with C++ as a first-class target and extended to Python with a lightweight binding.";
}
If( -Not (Test-Path .\projects\libdynd)) { mkdir .\projects\libdynd }
ConvertTo-Json $d |Set-Content .\projects\libdynd\manifest.json

$d=@{
    project = "o2scl";
    homepage = "http://web.utk.edu/~asteine1/o2scl/";
    devhome = "https://github.com/awsteiner/o2scl";
    scs = "git";
    cloneurl = "git clone https://github.com/awsteiner/o2scl.git";
    updatecmd = "git pull";
    buildcmd = "";
    lang = "c++";
    description = "O2scl is a C++ library for object-oriented numerical programming. It includes interpolation, differentiation, integration, roots of polynomials, equation solving, minimization, constrained minimization, Monte Carlo integration, simulated annealing, least-squares fitting, solution of ordinary differential equations, two-dimensional interpolation, Chebyshev approximation, unit conversions, and file I/O with HDF5.";
}
If( -Not (Test-Path .\projects\o2scl)) { mkdir .\projects\o2scl }
ConvertTo-Json $d |Set-Content .\projects\o2scl\manifest.json

$d=@{
    project = "petsc";
    homepage = "http://www.mcs.anl.gov/petsc/";
    scs = "git";
    cloneurl = "git clone -b maint https://bitbucket.org/petsc/petsc";
    updatecmd = "git pull";
    buildcmd = "";
    lang = "c++","fortran";
    description = "PETSc, pronounced PET-see (the S is silent), is a suite of data structures and routines for the scalable (parallel) solution of scientific applications modeled by partial differential equations. It supports MPI, and GPUs through CUDA or OpenCL, as well as hybrid MPI-GPU parallelism. ";
    note = "beside solving partial differential equations, codes illustrates how to do parallel scientific computing"
}
If( -Not (Test-Path .\projects\petsc)) { mkdir .\projects\petsc }
ConvertTo-Json $d |Set-Content .\projects\petsc\manifest.json

$d=@{
    project = "poco-lib";
    homepage = "https://pocoproject.org/";
    devhome = "https://github.com/pocoproject/poco";
    scs = "git";
    cloneurl = "git clone https://github.com/pocoproject/poco.git";
    updatecmd = "git pull";
    buildcmd = "";
    lang = "c++";
    description = "Modern, powerful open source C++ class libraries for building network- and internet-based applications that run on desktop, server, mobile and embedded systems.";
}
If( -Not (Test-Path .\projects\poco-lib)) { mkdir .\projects\poco-lib }
ConvertTo-Json $d |Set-Content .\projects\poco-lib\manifest.json

$d=@{
    project = "stan";
    homepage = "http://mc-stan.org";
    devhome = "https://github.com/stan-dev";
    scs = "git";
    cloneurl = "git clone https://github.com/stan-dev/stan.git";
    updatecmd="git pull";
    buildcmd="";
    description="";
}
If( -Not (Test-Path .\projects\stan)) { mkdir .\projects\stan }
ConvertTo-Json $d |Set-Content .\projects\stan\manifest.json


$d=@{
    project = "stan-math";
    homepage = "http://mc-stan.org";
    devhome = "https://github.com/stan-dev";
    scs = "git";
    cloneurl = "git clone https://github.com/stan-dev/math.git";
    updatecmd="git pull";
    buildcmd="";
    description="";
}
If( -Not (Test-Path .\projects\stan-math)) { mkdir .\projects\stan-math }
ConvertTo-Json $d |Set-Content .\projects\stan-math\manifest.json


$d=@{
    project = "stan-cmdstan";
    homepage = "http://mc-stan.org";
    devhome = "https://github.com/stan-dev";
    scs = "git";
    cloneurl = "git clone https://github.com/stan-dev/cmdstan.git";
    updatecmd="git pull";
    buildcmd="";
    description="";
}
If( -Not (Test-Path .\projects\stan-cmdstan)) { mkdir .\projects\stan-cmdstan }
ConvertTo-Json $d |Set-Content .\projects\stan-cmdstan\manifest.json

$d=@{
    project = "mlpack-ml";
    homepage = "http://mlpack.org/";
    devhome = "https://github.com/mlpack/mlpack";
    scs="git";
    cloneurl="git clone https://github.com/mlpack/mlpack.git";
    updatecmd="git pull";
    buildcmd="";
    description="mlpack is an intuitive, fast, scalable C++ machine learning library, meant to be a machine learning analog to LAPACK. It aims to implement a wide array of machine learning methods and functions as a `"swiss army knife`" for machine learning researchers."
}
If( -Not (Test-Path .\projects\mlpack-ml)) { mkdir .\projects\mlpack-ml }
ConvertTo-Json $d |Set-Content .\projects\mlpack-ml\manifest.json

$d=@{
    project="plplot";
    homepage="http://plplot.sourceforge.net/";
    devhome="";
    scs="git";
    cloneurl="git clone https://git.code.sf.net/p/plplot/plplot";
    updatecmd="";
    buildcmd="";
    description="PLplot is a cross-platform software package for creating scientific plots whose (UTF-8) plot symbols and text are limited in practice only by what Unicode-aware system fonts are installed on a user's computer.";
    lang="c";
}
If( -Not (Test-Path .\projects\plplot)) { mkdir .\projects\plplot }
ConvertTo-Json $d |Set-Content .\projects\plplot\manifest.json

$d=@{
    project="armadillo";
    homepage="http://arma.sourceforge.net/";
    devhome="https://github.com/conradsnicta/armadillo-code";
    scs="git";
    cloneurl="git clone https://github.com/conradsnicta/armadillo-code.git";
    updatecmd="git pull";
    buildcmd="";
    description="Armadillo is a high quality C++ linear algebra library, aiming towards a good balance between speed and ease of use.";
    lang="c++";
}
If( -Not (Test-Path .\projects\armadillo)) { mkdir .\projects\armadillo }
ConvertTo-Json $d |Set-Content .\projects\armadillo\manifest.json

$d=@{
    project="capnproto";
    homepage="https://capnproto.org/"
    devhome="https://github.com/sandstorm-io/capnproto";
    scs="git";
    cloneurl="git clone https://github.com/sandstorm-io/capnproto.git";
    updatecmd="git pull";
    buildcmd="";
    description="Cap'n Proto is an insanely fast data interchange format and capability-based RPC system. Think JSON, except binary. Or think Protocol Buffers, except faster. In fact, in benchmarks, Cap'n Proto is INFINITY TIMES faster than Protocol Buffers.";
    lang="c++";
}
If( -Not (Test-Path .\projects\capnproto)) { mkdir .\projects\capnproto }
ConvertTo-Json $d |Set-Content .\projects\capnproto\manifest.json

$d=@{
    project="sfml";
    homepage="https://www.sfml-dev.org/index.php";
    devhome="https://www.sfml-dev.org/development.php";
    cloneurl="git clone https://github.com/SFML/SFML.git";
    updatecmd="git pull";
    buildcmd="";
    description="SFML is a simple, fast, cross-platform and object-oriented multimedia API. It provides access to windowing, graphics, audio and network. It is written in C++, and has bindings for various languages such as C, .Net, Ruby, Python";
    lang="c++";
}
If( -Not (Test-Path .\projects\sfml)) { mkdir .\projects\sfml }
ConvertTo-Json $d |Set-Content .\projects\sfml\manifest.json

$d=@{
    project="gretl";
    homepage="http://gretl.sourceforge.net/";
    scs="git";
    cloneurl="git clone https://git.code.sf.net/p/gretl/git gretl-git";
    updatecmd="git pull";
    buildcmd="";
    lang="c";
    description="Is a cross-platform software package for econometric analysis, written in the C programming language.";
}

$d=@{
    project="vowpal_wabbit";
    homepage="http://hunch.net/~vw/";
    devhome="https://github.com/JohnLangford/vowpal_wabbit";
    scs="git";
    cloneurl="git clone https://github.com/JohnLangford/vowpal_wabbit.git";
    updatecmd="git pull";
    buildcmd="";
    depends="boost","zlib";
    description="Vowpal Wabbit is a machine learning system which pushes the frontier of machine learning with techniques such as online, hashing, allreduce, reductions, learning2search, active, and interactive learning.:"
    lang="c++";
}

$d=@{
    project="skipdb";
    homepage="";
    scs="git";
    devhome="https://github.com/stevedekorte/skipdb";
    cloneurl="git clone https://github.com/stevedekorte/skipdb.git";
    updatecmd="git pull";
    buildcmd="";
    lang="c";
    description="A Berkeley DB style database implemented with a skip list instead of a b-tree. It's small, portable and supports ACID transactions (with true durability)."
}

$d=@{
    project="tiny-dnn";
    homepage="";
    devhome="https://github.com/tiny-dnn/tiny-dnn";
    cloneurl="git clone https://github.com/tiny-dnn/tiny-dnn.git";
    updatecmd="git pull";
    buildcmd="";
    description="header only, dependency-free deep learning framework in C++11";
    lang="c++";
}

$d=@{
    project="caffe-ml";
    homepage="";
    devhome="https://github.com/BVLC/caffe";
    scs="git";
    cloneurl="git clone https://github.com/BVLC/caffe.git";
    updatecmd="git pull";
    buildcmd="";
    description="Caffe is a deep learning framework made with expression, speed, and modularity in mind. It is developed by Berkeley AI Research (BAIR)/The Berkeley Vision and Learning Center (BVLC) and community contributors.";
    lang="c++","python";
}

$d=@{
    project="tensorflow-ml";
    homepage="https://www.tensorflow.org/";
    devhome="https://github.com/tensorflow";
    scs="git";
    cloneurl="git clone https://github.com/tensorflow/tensorflow.git";
    updatecmd="git pull";
    buildcmd="";
    description="TensorFlow is an open source software library for numerical computation using data flow graphs."
    lang="c++";
}

$d=@{
    project="torch-ml";
    homepage="http://torch.ch/";
    devhome="https://github.com/torch/torch7";
    scs="git";
    cloneurl="git clone https://github.com/torch/torch7.git";
    updatecmd="git pull";
    buildcmd="";
    description="Torch is a scientific computing framework with wide support for machine learning algorithms that puts GPUs first. It is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.";
    lang="c","lua";
}

$d=@{
    project="mc-fastflow";
    homepage="http://calvados.di.unipi.it/fastflow";
    devhome="https://sourceforge.net/projects/mc-fastflow/";
    scs="svn";
    cloneurl="";
    clonescript="svn checkout https://svn.code.sf.net/p/mc-fastflow/code/ mc-fastflow-code";
    updatecmd="";
    buildcmd="";
    description="FastFlow is a multi-cores programming framework implemented as a C++ template 
library that offers a set of mechanisms to support low-latency and 
high-bandwidth data flows in a network of threads running on
a cache-coherent multi-core architectures.";
    lang="c++";
}

$d=@{
    project="caffe2-ml";
    homepage="https://caffe2.ai/";
    devhome="https://github.com/caffe2/caffe2";
    scs="git";
    cloneurl="git clone https://github.com/caffe2/caffe2.git";
    updatecmd="git pull";
    buildcmd="";
    description="Caffe2 is a lightweight, modular, and scalable deep learning framework. Building on the original Caffe, Caffe2 is designed with expression, speed, and modularity in mind.";
    lang="c++";
}

$d=@{
    project="opensim";
    homepage="http://opensimulator.org/wiki/Main_Page";
    devhome="http://opensimulator.org/wiki/Developer_Documentation";
    scs="git";
    cloneurl="git clone git://opensimulator.org/git/opensim";
    lang="c-sharp";
    updatecmd="";
    buildcmd="";
    description="OpenSimulator is an open source multi-platform, multi-user 3D application server."
}

$d=@{
    project="fix8";
    homepage="http://www.fix8.org/";
    devhome="https://github.com/fix8/fix8";
    scs="git";
    cloneurl="git clone https://github.com/fix8/fix8.git";
    updatecmd="git pull";
    buildcmd="";
    description="Modern open source C++ FIX framework featuring complete schema customisation, high performance and fast development. ";
    lang="c++"
}

$d=@{
    project="timeseriesdb";
    homepage="";
    devhome="https://github.com/nyurik/timeseriesdb";
    scs="git";
    cloneurl="git clone https://github.com/nyurik/timeseriesdb.git";
    updatecmd="git pull";
    buildcmd="";
    description="TimeSeriesDb is a .NET library designed to store vast amount of data series in flat files.";
    lang="c-sharp"
}

$d=@{
    project="sonnet-tf";
    homepage="";
    devhome="https://github.com/deepmind/sonnet";
    scs="git";
    cloneurl="git clone https://github.com/deepmind/sonnet.git";
    updatecmd="git pull";
    buildcmd="";
    description="Sonnet is a library built on top of TensorFlow for building complex neural networks.";
    lang="python","c++"
}

$d=@{
    project="json4moderncpp-lib";
    homepage="https://nlohmann.github.io/json/";
    devhome="https://github.com/nlohmann/json";
    scs="git";
    cloneurl="git clone https://github.com/nlohmann/json.git";
    updateurl="git pull";
    buildcmd="";
    lang="c++";
    description="JSON for Modern C++, a C++11 header-only JSON class. (Also has CBOR and MessagePack serializers)";
}

$d=@{
    project="rios-os";
    homepage="http://www.riot-os.org/";
    devhome="https://github.com/RIOT-OS/";
    scs="git";
    cloneurl="git clone https://github.com/RIOT-OS/RIOT.git";
    updatecmd="git pull";
    buildcmd="";
    description="RIOT powers the Internet of Things like Linux powers the Internet. RIOT is a free, open source operating system developed by a grassroots community gathering companies, academia, and hobbyists, distributed all around the world. ";
    lang="c"
}

$d=@{
    project="libtrading";
    homepage="http://libtrading.org/";
    devhome="https://github.com/penberg/libtrading";
    scs="git";
    cloneurl="git clone https://github.com/penberg/libtrading.git";
    updatecmd="git pull";
    buildcmd="";
    description="Libtrading is an open source API for high-performance, low-latency trading applications. It implements network protocols used for communicating with exchanges, dark pools, and other trading venues. The API supports FIX, FIX/FAST, and many proprietary protocols such as ITCH and OUCH used by NASDAQ.";
    lang="c"
}

$d=@{
    project="disruptor-dotnet";
    homepage="";
    devhome="https://github.com/disruptor-net/Disruptor-net";
    scs="git";
    cloneurl="git clone https://github.com/disruptor-net/Disruptor-net.git";
    updatecmd="";
    buildcmd="";
    description="This project aims to provide the full functionality of the Disruptor to CLR projects.";
    lang="c-sharp"
}

$d=@{
    project="hpx-cpp";
    homepage="http://stellar-group.org/libraries/hpx/";
    devhome="https://github.com/STEllAR-GROUP/hpx";
    scs="git";
    cloneurl="git clone https://github.com/STEllAR-GROUP/hpx.git";
    updatecmd="git pull";
    buildcmd="";
    lang="c++";
    description="HPX is a C++ Standard Library for Concurrency and Parallelism. It implements all of the corresponding facilities as defined by the C++ Standard. Additionally, in HPX we implement functionalities proposed as part of the ongoing C++ standardization process. We also extend the C++ Standard APIs to the distributed case."
}

########
$d=@{
    project="libevent-book";
    cloneurl="git clone git://github.com/nmathewson/libevent-book.git";
    description="???"
}

$d=@{
    project="libevent";
    cloneurl="";
    description="";
}

$d=@{
    project="libev";
    cloneurl="";
}

$d=@{
    project="libpqxx";
    homepage="http://pqxx.org/development/libpqxx/";
    devhome="https://github.com/jtv/libpqxx";
    cloneurl="";
}

$d=@{
    project="nanomsg";
    devhome="https://github.com/nanomsg/nanomsg";
    cloneurl="git clone https://github.com/nanomsg/nanomsg.git";
}

$d=@{
    project="mshadow";
    devhome="https://github.com/dmlc/mshadow";
    cloneurl="git clone https://github.com/dmlc/mshadow.git";
    description="MShadow is a lightweight CPU/GPU Matrix/Tensor Template Library in C++/CUDA."
}

$d=@{
    project="mxnet";
    homepage="http://mxnet.io/";
    devhome="https://github.com/dmlc/mxnet";
    cloneurl="git clone https://github.com/dmlc/mxnet.git";
    description="MXNet is a deep learning framework designed for both efficiency and flexibility. "
}

$d=@{
    project="redis";
    homepage="https://redis.io/";
    devhome="https://github.com/antirez/redis";
    cloneurl="git clone https://github.com/antirez/redis.git";
    description="Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker.";
}

$d=@{
    project="aquila";
    homepage="http://aquila-dsp.org/";
    devhome="https://github.com/zsiciarz/aquila";
    cloneurl="git clone https://github.com/zsiciarz/aquila.git";
    description="Aquila is an open source and cross-platform DSP (Digital Signal Processing) library written in C++."
}

$d=@{
    project="tapkee-lib";
    homepage="http://tapkee.lisitsyn.me/";
}

$d=@{
    project="googletest";
}

$d=@{
    project="fmtlib";
    devhome="https://github.com/fmtlib/fmt";
}