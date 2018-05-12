from libcpp.memory cimport unique_ptr
from folly.executor cimport cAsyncioExecutor

cdef extern from "folly/fibers/LoopController.h" namespace "folly::fibers":
    cdef cppclass cLoopController "folly::fibers::LoopController":
        pass

cdef extern from "folly/fibers/FiberManagerInternal.h" namespace "folly::fibers":
    cdef cppclass cFiberManagerOptions "folly::fibers::FiberManager::Options":
        pass
    cdef cppclass cFiberManager "folly::fibers::FiberManager":
        cFiberManager(unique_ptr[cLoopController], const cFiberManagerOptions&)

cdef extern from "folly/python/AsyncioLoopController.h" namespace "folly::python":
    cdef cppclass cAsyncioLoopController "folly::python::AsyncioLoopController"(cLoopController):
        cAsyncioLoopController(cAsyncioExecutor*)

cdef api cFiberManager* get_fiber_manager(const cFiberManagerOptions&)
