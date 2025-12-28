return {
  {
    "Civitasv/cmake-tools.nvim",
    opts = {
      cmake_build_directory = function ()
        if require("cmake-tools.osys").iswin32 then
          return "build\\${variant:buildType}"
        end
        return "build/${variant:buildType}"
      end
    }
  }
}
