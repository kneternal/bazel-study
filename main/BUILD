load('//main:hipping.bzl', 'hip_rule')
load('//main:hipping.bzl', 'hip_link')

cc_library(
    name = "hello-greet",
    srcs = ["hello-greet.cc"],
    hdrs = ["hello-greet.h"],
)

cc_binary(
    name = "axpy_cc",
    srcs = ["axpy.cu.cc"],
    deps = [
        ":hello-greet",
        "//lib:hello-time",
    ],
)

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    deps = [
    	 ":hello-greet",
	 "//lib:hello-time",
    ],
)


genrule(
	name = "hipify1",
	srcs = ["axpy.cu"],
	outs = ["axpy.cu.hip"],
	cmd = "hipify-clang $(SRCS) -o $@ -- -x cuda",
)


hip_rule(
    name = "axpy_o",
    out = "axpy.o",
    deps = [":hipify1"],# ":hello-greet", "//lib:hello-time"],
)

hip_link(
    name = "axpy_link",
    out = "axpy",
    deps = [":axpy_o", ":hello-greet", "//lib:hello-time"],
)

sh_binary(
	name = "link_script",
	srcs = ["link.sh"],
)

sh_binary(
	name = "obj_script",
	srcs = ["obj.sh"],
)