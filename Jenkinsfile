def UPSTREAM_PROJECTS_LIST = [ "Mule-runtime/mule-extensions-parent/support/1.0.x" ]

Map pipelineParams = [ "upstreamProjects" : UPSTREAM_PROJECTS_LIST.join(','),
                       "projectType" : "Runtime" ]

runtimeBuild(pipelineParams)
