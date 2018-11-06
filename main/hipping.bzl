def _hip_rule_impl(ctx):
    print("Target {} has {} deps".format(ctx.label, len(ctx.attr.deps)))

    # For each target in deps, print its label and files.
    for i, d in enumerate(ctx.attr.deps):
        print(" {}. label = {}".format(i + 1, d.label))

        # A label can represent any number of files (possibly 0).
        print("    files = " + str([f.path for f in d.files.to_list()]))

    # For debugging, consider using `dir` to explore the existing fields.
    print(dir(ctx))  # prints all the fields and methods of ctx


    print("Start compile with clang")

    args = [ctx.outputs.out.path] + [ctx.attr.deps[0].files.to_list()[0].path]
    print(args)
    ctx.actions.run(
        inputs = ctx.files.deps,
        outputs = [ctx.outputs.out],
        arguments = args,
        progress_message = "create the obj",
        executable = ctx.executable._obj_tool,
    )

def _hip_link_impl(ctx):
    print("Target {} has {} deps".format(ctx.label, len(ctx.attr.deps)))

    args = [f.path for f in ctx.files.deps]+ [ctx.outputs.out.path]

    print(args)

    ctx.actions.run(
        inputs = ctx.files.deps,
        outputs = [ctx.outputs.out],
        arguments = args,
        progress_message = "linking",
        executable = ctx.executable._link_tool,
    )

hip_rule = rule(
    implementation = _hip_rule_impl,
    attrs = {
#	"name": attr.string(),
	"deps": attr.label_list(),
        "out": attr.output(),
        "_obj_tool": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("//main:obj_script")
        )
    },
)


hip_link = rule(    
    implementation = _hip_link_impl,
    attrs = {
        "deps": attr.label_list(),
        "out": attr.output(),
        "_link_tool": attr.label(
            executable = True,
            cfg = "host",
            allow_files = True,
            default = Label("//main:link_script")
        ),
    },
)
