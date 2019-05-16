#if !defined(IMGUI_IMPL_OPENGL_LOADER_GL3W) && \
    !defined(IMGUI_IMPL_OPENGL_LOADER_GLEW) && \
    !defined(IMGUI_IMPL_OPENGL_LOADER_GLAD) && \
    !defined(IMGUI_IMPL_OPENGL_LOADER_CUSTOM)
#define IMGUI_IMPL_OPENGL_LOADER_GL3W
#endif
extern "C" {
bool ImGui_ImplOpenGL3_Init(const char* glsl_version = NULL);
void ImGui_ImplOpenGL3_Shutdown();
void ImGui_ImplOpenGL3_NewFrame();
void ImGui_ImplOpenGL3_RenderDrawData(ImDrawData* draw_data);

// Called by Init/NewFrame/Shutdown
bool ImGui_ImplOpenGL3_CreateFontsTexture();
void ImGui_ImplOpenGL3_DestroyFontsTexture();
bool ImGui_ImplOpenGL3_CreateDeviceObjects();
void ImGui_ImplOpenGL3_DestroyDeviceObjects();
}
