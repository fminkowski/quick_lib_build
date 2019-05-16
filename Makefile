build:
	mkdir -p build
	mkdir -p build/bin
	#build gl3w 
	python gl3w/gl3w_gen.py
	mv include build/include
	mv src build/src
	#build glfw
	mkdir -p ./glfw/build
	cd ./glfw/build; cmake -DBUILD_SHARED_LIBS=ON ../; make
	cp ./glfw/build/src/*.dylib ./build/bin
	#imgui impl
	cp ./cimgui/imgui/examples/*.cpp ./build/src
	
	clang++ -shared \
		./d_cimgui.cpp \
		./build/src/gl3w.c ./cimgui/cimgui.cpp  \
		./cimgui/imgui/imgui.cpp ./cimgui/imgui/imgui_demo.cpp \
		./cimgui/imgui/imgui_draw.cpp ./cimgui/imgui/imgui_widgets.cpp \
		./build/src/imgui_impl_opengl3.cpp .//build/src/imgui_impl_glfw.cpp \
		-I./build/include -I./cimgui/imgui/ -I./glfw/include -I./ \
		./build/bin/libglfw.3.4.dylib \
		-o ./build/bin/imgui_glfw.dylib \
		-framework OpenGL

clean:
	rm -rf build
	rm -rf glfw/build

install:
	cp ./build/bin/*.dylib /usr/local/lib/
