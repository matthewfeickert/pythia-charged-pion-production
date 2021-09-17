ARG BASE_IMAGE=scailfin/madgraph5-amc-nlo-centos:mg5_amc3.2.0
FROM ${BASE_IMAGE} as base

RUN echo "exit" | mg5_aMC && \
    rm py.py && \
    lhapdf get NNPDF23_lo_as_0130_qed

COPY main01.cc .
COPY CMakeLists.txt .
COPY cmake .
RUN cmake -S . -B build
# RUN export PYTHIA8_INCLUDE_DIR

# ROOT-build-recipes/v6.22.02/root/cmake/modules/FindPythia8.cmake:# PYTHIA8_INCLUDE_DIR   where to locate Pythia.h file
# ROOT-build-recipes/v6.22.02/root/cmake/modules/FindPythia8.cmake:find_path(PYTHIA8_INCLUDE_DIR
# ROOT-build-recipes/v6.22.02/root/cmake/modules/FindPythia8.cmake:set(PYTHIA8_INCLUDE_DIRS ${PYTHIA8_INCLUDE_DIR} ${PYTHIA8_INCLUDE_DIR}/Pythia8 )
# ROOT-build-recipes/v6.22.02/root/cmake/modules/FindPythia8.cmake:find_package_handle_standard_args(Pythia8 DEFAULT_MSG PYTHIA8_INCLUDE_DIR PYTHIA8_LIBRARY)
# ROOT-build-recipes/v6.22.02/root/cmake/modules/FindPythia8.cmake:mark_as_advanced(PYTHIA8_INCLUDE_DIR PYTHIA8_LIBRARY PYTHIA8_hepmcinterface_LIBRARY PYTHIA8_lhapdfdummy_LIBRARY)
# ROOT-build-recipes/v6.22.02/root/montecarlo/pythia8/CMakeLists.txt:include_directories(${PYTHIA8_INCLUDE_DIR})
