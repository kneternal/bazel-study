package(default_visibility = ['//visibility:public'])

cc_toolchain_suite(
	name = "hipify",
	toolchains = {
		   "x96|hipify": ":hipify_toolchain",
	},

)


filegroup(name = "empty")
cc_toolchain(
    name = "hipify_toolchain",
    all_files = ":empty",
    compiler_files = ":empty",
    cpu = "x96",
    dwp_files = ":empty",
    dynamic_runtime_libs = [":empty"],
    linker_files = ":empty",
    objcopy_files = ":empty",
    static_runtime_libs = [":empty"],
    strip_files = ":empty",
    supports_param_files = 0,
)