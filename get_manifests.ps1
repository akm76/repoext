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
    updatecmd = "git pull";
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
If( -Not (Test-Path .\projects\gretl)) { mkdir .\projects\gretl }
ConvertTo-Json $d |Set-Content .\projects\gretl\manifest.json

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
If( -Not (Test-Path .\projects\vowpal_wabbit)) { mkdir .\projects\vowpal_wabbit }
ConvertTo-Json $d |Set-Content .\projects\vowpal_wabbit\manifest.json

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
If( -Not (Test-Path .\projects\skipdb)) { mkdir .\projects\skipdb }
ConvertTo-Json $d |Set-Content .\projects\skipdb\manifest.json

$d=@{
    project="tiny-dnn";
    homepage="";
    devhome="https://github.com/tiny-dnn/tiny-dnn";
    scs="git";
    cloneurl="git clone https://github.com/tiny-dnn/tiny-dnn.git";
    updatecmd="git pull";
    buildcmd="";
    description="header only, dependency-free deep learning framework in C++11";
    lang="c++";
}
If( -Not (Test-Path .\projects\tiny-dnn)) { mkdir .\projects\tiny-dnn }
ConvertTo-Json $d |Set-Content .\projects\tiny-dnn\manifest.json

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
If( -Not (Test-Path .\projects\caffe-ml)) { mkdir .\projects\caffe-ml }
ConvertTo-Json $d |Set-Content .\projects\caffe-ml\manifest.json

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
If( -Not (Test-Path .\projects\tensorflow-ml)) { mkdir .\projects\tensorflow-ml }
ConvertTo-Json $d |Set-Content .\projects\tensorflow-ml\manifest.json

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
If( -Not (Test-Path .\projects\torch-ml)) { mkdir .\projects\torch-ml }
ConvertTo-Json $d |Set-Content .\projects\torch-ml\manifest.json

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
If( -Not (Test-Path .\projects\mc-fastflow)) { mkdir .\projects\mc-fastflow }
ConvertTo-Json $d |Set-Content .\projects\mc-fastflow\manifest.json

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
If( -Not (Test-Path .\projects\caffe2-ml)) { mkdir .\projects\caffe2-ml }
ConvertTo-Json $d |Set-Content .\projects\caffe2-ml\manifest.json

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
If( -Not (Test-Path .\projects\opensim)) { mkdir .\projects\opensim }
ConvertTo-Json $d |Set-Content .\projects\opensim\manifest.json

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
If( -Not (Test-Path .\projects\fix8)) { mkdir .\projects\fix8 }
ConvertTo-Json $d |Set-Content .\projects\fix8\manifest.json

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
If( -Not (Test-Path .\projects\timeseriesdb)) { mkdir .\projects\timeseriesdb }
ConvertTo-Json $d |Set-Content .\projects\timeseriesdb\manifest.json

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
If( -Not (Test-Path .\projects\sonnet-tf)) { mkdir .\projects\sonnet-tf }
ConvertTo-Json $d |Set-Content .\projects\sonnet-tf\manifest.json

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
If( -Not (Test-Path .\projects\json4moderncpp-lib)) { mkdir .\projects\json4moderncpp-lib }
ConvertTo-Json $d |Set-Content .\projects\json4moderncpp-lib\manifest.json

$d=@{
    project="riot-os";
    homepage="http://www.riot-os.org/";
    devhome="https://github.com/RIOT-OS/";
    scs="git";
    cloneurl="git clone https://github.com/RIOT-OS/RIOT.git";
    updatecmd="git pull";
    buildcmd="";
    description="RIOT powers the Internet of Things like Linux powers the Internet. RIOT is a free, open source operating system developed by a grassroots community gathering companies, academia, and hobbyists, distributed all around the world. ";
    lang="c"
}
If( -Not (Test-Path .\projects\riot-os)) { mkdir .\projects\riot-os }
ConvertTo-Json $d |Set-Content .\projects\riot-os\manifest.json

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
If( -Not (Test-Path .\projects\libtrading)) { mkdir .\projects\libtrading }
ConvertTo-Json $d |Set-Content .\projects\libtrading\manifest.json

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
If( -Not (Test-Path .\projects\disruptor-dotnet)) { mkdir .\projects\disruptor-dotnet }
ConvertTo-Json $d |Set-Content .\projects\disruptor-dotnet\manifest.json

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
If( -Not (Test-Path .\projects\hpx-cpp)) { mkdir .\projects\hpx-cpp }
ConvertTo-Json $d |Set-Content .\projects\hpx-cpp\manifest.json

$d=@{
    project="theano";
    homepage="http://deeplearning.net/software/theano/index.html";
    devhome="https://github.com/Theano/Theano";
    scs="git";
    cloneurl="git clone https://github.com/Theano/Theano.git";
    updatecmd="git pull";
    buildcmd="";
    description="Theano is a Python library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently.";
    lang="python";
}
If( -Not (Test-Path .\projects\theano)) { mkdir .\projects\theano }
ConvertTo-Json $d |Set-Content .\projects\theano\manifest.json

$d=@{
    project="mshadow";
    devhome="https://github.com/dmlc/mshadow";
    scs="git";
    cloneurl="git clone https://github.com/dmlc/mshadow.git";
    updatecmd="git pull";
    buildcmd="";
    description="MShadow is a lightweight CPU/GPU Matrix/Tensor Template Library in C++/CUDA.";
    lang="c++"
}
If( -Not (Test-Path .\projects\mshadow)) { mkdir .\projects\mshadow }
ConvertTo-Json $d |Set-Content .\projects\mshadow\manifest.json

$d=@{
    project="mxnet";
    homepage="http://mxnet.io/";
    devhome="https://github.com/dmlc/mxnet";
    scs="git";
    cloneurl="git clone https://github.com/dmlc/mxnet.git";
    updatecmd="git pull";
    buildcmd="";
    description="MXNet is a deep learning framework designed for both efficiency and flexibility. ";
    lang="c++"
}
If( -Not (Test-Path .\projects\mxnet)) { mkdir .\projects\mxnet }
ConvertTo-Json $d |Set-Content .\projects\mxnet\manifest.json

$d=@{
    project="redis";
    homepage="https://redis.io/";
    devhome="https://github.com/antirez/redis";
    scs="git";
    updatecmd="git pull";
    buildcmd="";
    cloneurl="git clone https://github.com/antirez/redis.git";
    description="Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker.";
}
If( -Not (Test-Path .\projects\redis)) { mkdir .\projects\redis }
ConvertTo-Json $d |Set-Content .\projects\redis\manifest.json

$d=@{
    project="aquila";
    homepage="http://aquila-dsp.org/";
    devhome="https://github.com/zsiciarz/aquila";
    scs="git";
    cloneurl="git clone https://github.com/zsiciarz/aquila.git";
    updatecmd="git pull";
    buildcmd="";
    description="Aquila is an open source and cross-platform DSP (Digital Signal Processing) library written in C++."
}
If( -Not (Test-Path .\projects\aquila)) { mkdir .\projects\aquila }
ConvertTo-Json $d |Set-Content .\projects\aquila\manifest.json

$d=@{
    project="fmtlib";
    homepage="http://fmtlib.net/latest/index.html";
    devhome="https://github.com/fmtlib/fmt";
    scs="git";
    cloneurl="git clone https://github.com/fmtlib/fmt.git";
    updatecmd="git pull";
    buildcmd="";
    description="fmt is an open-source formatting library for C++. It can be used as a safe alternative to printf or as a fast alternative to IOStreams.";
    lang="c++";
}
If( -Not (Test-Path .\projects\fmtlib)) { mkdir .\projects\fmtlib }
ConvertTo-Json $d |Set-Content .\projects\fmtlib\manifest.json

$d=@{
    project="googletest";
    devhome="https://github.com/google/googletest";
    scs="git";
    cloneurl="git clone https://github.com/google/googletest.git";
    updatecmd="git pull";
    buildcmd="";
    description="This repository is a merger of the formerly separate GoogleTest and GoogleMock projects. ";
    lang="c++"
}
If( -Not (Test-Path .\projects\googletest)) { mkdir .\projects\googletest }
ConvertTo-Json $d |Set-Content .\projects\googletest\manifest.json

$d=@{
    project="nanomsg";
    devhome="https://github.com/nanomsg/nanomsg";
    scs="git";
    cloneurl="git clone https://github.com/nanomsg/nanomsg.git";
    updatecmd="git pull";
    description="The nanomsg library is a simple high-performance implementation of several scalability protocols.These scalability protocols are light-weight messaging protocols which can be used to solve a number of very common messaging patterns, such as request/reply, publish/subscribe, surveyor/respondent, and so forth. These protocols can run over a variety of transports such as TCP, UNIX sockets, and even WebSocket";
    lang="c"
}
If( -Not (Test-Path .\projects\nanomsg)) { mkdir .\projects\nanomsg }
ConvertTo-Json $d |Set-Content .\projects\nanomsg\manifest.json

$d=@{
    project="libpqxx";
    homepage="http://pqxx.org/development/libpqxx/";
    devhome="https://github.com/jtv/libpqxx";
    scs="git";
    cloneurl="git clone https://github.com/jtv/libpqxx.git";
    updatecmd="git pull";
    buildcmd="";
    lang="c++";
    description="libpqxx is the official C++ client API for ​PostgreSQL, the enterprise-strength open-source relational database."
}
If( -Not (Test-Path .\projects\libpqxx)) { mkdir .\projects\libpqxx }
ConvertTo-Json $d |Set-Content .\projects\libpqxx\manifest.json

$d=@{
    project="libevent";
    homepage="http://libevent.org/";
    devhome="https://github.com/libevent/libevent";
    scs="git";
    cloneurl="git clone https://github.com/libevent/libevent.git";
    updatecmd="git pull";
    buildcmd="";
    description="The libevent API provides a mechanism to execute a callback function when a specific event occurs on a file descriptor or after a timeout has been reached. Furthermore, libevent also support callbacks due to signals or regular timeouts.";
    lang="c";
}
If( -Not (Test-Path .\projects\libevent)) { mkdir .\projects\libevent }
ConvertTo-Json $d |Set-Content .\projects\libevent\manifest.json

$d=@{
    project="libuv";
    homepage="http://libuv.org/";
    devhome="https://github.com/libuv/libuv";
    scs="git";
    cloneurl="git clone https://github.com/libuv/libuv.git";
    updatecmd="git pull";
    buildcmd="";
    description="libuv is a multi-platform support library with a focus on asynchronous I/O. ";
    lang="c";
}
If( -Not (Test-Path .\projects\libuv)) { mkdir .\projects\libuv }
ConvertTo-Json $d |Set-Content .\projects\libuv\manifest.json

$d=@{
    project="zmq";
    homepage="http://zeromq.org/";
    devhome="https://github.com/zeromq/libzmq";
    scs="git";
    cloneurl="git clone https://github.com/zeromq/libzmq.git";
    updatecmd="git pull";
    buildcmd="";
    description="The ZeroMQ lightweight messaging kernel is a library which extends the standard socket interfaces with features traditionally provided by specialised messaging middleware products. ZeroMQ sockets provide an abstraction of asynchronous message queues, multiple messaging patterns, message filtering (subscriptions), seamless access to multiple transport protocols and more.";
    lang="c++"
}
If( -Not (Test-Path .\projects\zmq)) { mkdir .\projects\zmq }
ConvertTo-Json $d |Set-Content .\projects\zmq\manifest.json

$d=@{
    project="tapkee-lib";
    homepage="http://tapkee.lisitsyn.me/";
    devhome="https://github.com/lisitsyn/tapkee";
    scs="git";
    cloneurl="git clone https://github.com/lisitsyn/tapkee.git";
    updatecmd="git pull";
    buildcmd="";
    description="Tapkee is a C++ template library for dimensionality reduction with some bias on spectral methods.";
    lang="c++"
}
If( -Not (Test-Path .\projects\tapkee-lib)) { mkdir .\projects\tapkee-lib }
ConvertTo-Json $d |Set-Content .\projects\tapkee-lib\manifest.json

$d=@{
    project="wt-cpp";
    homepage="https://www.webtoolkit.eu/wt";
    devhome="https://github.com/emweb/wt";
    scs="git";
    cloneurl="git clone https://github.com/emweb/wt.git";
    updatecmd="git pull";
    buildcmd="";
    description="Wt is a C++ library for developing web applications.";
    lang="c++"
}
If( -Not (Test-Path .\projects\wt-cpp)) { mkdir .\projects\wt-cpp }
ConvertTo-Json $d |Set-Content .\projects\wt-cpp\manifest.json

$d=@{
    project="quantlib";
    homepage="http://quantlib.org";
    devhome="https://github.com/lballabio/quantlib";
    scs="git";
    cloneurl="https://github.com/lballabio/QuantLib.git";
    updatecmd="git pull";
    buildcmd="";
    description="The QuantLib project (http://quantlib.org) is aimed at providing a comprehensive software framework for quantitative finance. QuantLib is a free/open-source library for modeling, trading, and risk management in real-life.";
    lang="c++"
}
If( -Not (Test-Path .\projects\quantlib)) { mkdir .\projects\quantlib }
ConvertTo-Json $d |Set-Content .\projects\quantlib\manifest.json

$d=@{
    project="rapidjson";
    homepage="http://rapidjson.org/";
    devhome="https://github.com/miloyip/rapidjson";
    scs="git";
    cloneurl="git clone https://github.com/miloyip/rapidjson.git";
    updatecmd="git pull";
    buildcmd="";
    description="RapidJSON is a JSON parser and generator for C++. It was inspired by RapidXml.";
    lang="c++";
}
If( -Not (Test-Path .\projects\rapidjson)) { mkdir .\projects\rapidjson }
ConvertTo-Json $d |Set-Content .\projects\rapidjson\manifest.json

$d=@{
    project="arrow-cpp";
    homepage="http://arrow.apache.org/";
    devhome="https://github.com/apache/arrow";
    scs="git";
    cloneurl="git clone https://github.com/apache/arrow.git";
    updatecmd="git pull";
    buildcmd="";
    description="Arrow is a set of technologies that enable big-data systems to process and move data fast.";
    lang="c++","java";
}
If( -Not (Test-Path .\projects\arrow-cpp)) { mkdir .\projects\arrow-cpp }
ConvertTo-Json $d |Set-Content .\projects\arrow-cpp\manifest.json

$d=@{
    project="jemalloc";
    homepage="http://jemalloc.net/";
    devhome="https://github.com/jemalloc/jemalloc";
    scs="git";
    cloneurl="git clone https://github.com/jemalloc/jemalloc.git";
    updatecmd="git pull";
    buildcmd="";
    description="jemalloc is a general purpose malloc(3) implementation that emphasizes
fragmentation avoidance and scalable concurrency support.";
    lang="c";
}
If( -Not (Test-Path .\projects\jemalloc)) { mkdir .\projects\jemalloc }
ConvertTo-Json $d |Set-Content .\projects\jemalloc\manifest.json

$d=@{
    project="dillo";
    homepage="https://www.dillo.org/";
    scs="hg";
    cloneurl="hg clone http://hg.dillo.org/dillo";
    description="Dillo is a multi-platform graphical web browser known for its speed and small footprint.";
    lang="c++";
}
If( -Not (Test-Path .\projects\dillo)) { mkdir .\projects\dillo }
ConvertTo-Json $d |Set-Content .\projects\dillo\manifest.json

$d=@{
    project="datamash";
    homepage="https://www.gnu.org/software/datamash/";
    devhome="http://savannah.gnu.org/projects/datamash/";
    scs="git";
    cloneurl="git clone https://git.savannah.gnu.org/git/datamash.git";
    description="GNU Datamash is a command-line program which performs basic numeric,textual and statistical operations on input textual data files. it is designed to be portable and reliable, and aid researchers to easily automate analysis pipelines, without writing c";
}
If( -Not (Test-Path .\projects\datamash)) { mkdir .\projects\datamash }
ConvertTo-Json $d |Set-Content .\projects\datamash\manifest.json

$d=@{
    project="jlang";
    homepage="http://jsoftware.com/";
    scs="git";
    cloneurl="https://github.com/jsoftware/jsource.git";
    description="J (J language) is a high-level, general-purpose, high-performance programming language.";
}
If( -Not (Test-Path .\projects\jlang)) { mkdir .\projects\jlang }
ConvertTo-Json $d |Set-Content .\projects\jlang\manifest.json


########
# Projects below need to have their manifests complete
$d=@{
    project="libevent-book";
    cloneurl="git clone git://github.com/nmathewson/libevent-book.git";
    description="???"
}


$d=@{
    project="libev";
    homepage="http://software.schmorp.de/pkg/libev.html";
    devhome="https://github.com/enki/libev"; # clone of a versioned package?
    scs="git"; # the origin homepage has cvs
    cloneurl="";
}



$d=@{
    project="plotutils";
    homepage="https://www.gnu.org/software/plotutils/";
    # can't find the actual source repository, only snapshots...
}

$d=@{
    project="datamash";
    homepage="https://www.gnu.org/software/datamash/";
    devhome="http://savannah.gnu.org/projects/datamash/";
    scs="git";
    cloneurl="git clone https://git.savannah.gnu.org/git/datamash.git";
    description="GNU Datamash is a command-line program which performs basic numeric,textual and statistical operations on input textual data files. it is designed to be portable and reliable, and aid researchers to easily automate analysis pipelines, without writing c";
}

$d=@{
    project="fltk";
    homepage="http://www.fltk.org/index.php";
}

$d=@{
    project="itpp-lib";
    homepage="http://itpp.sourceforge.net";
    scs="git";
    cloneurl="git clone https://git.code.sf.net/p/itpp/git";
    description="IT++ is a C++ library of mathematical, signal processing and communication classes and functions. Its main use is in simulation of communication systems and for performing research in the area of communications.";
}

# maybe historic interest only
$d=@{
    project="kona";
}

