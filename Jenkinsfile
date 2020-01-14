def UPSTREAM_PROJECTS_LIST = [ "Mule-runtime/mule-extensions-parent/1.2.x" ]

Map pipelineParams = [ "upstreamProjects" : UPSTREAM_PROJECTS_LIST.join(','),
                       "projectType" : "Runtime" ]

runtimeBuild(pipelineParams)
