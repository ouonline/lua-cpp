# This Makefile is generated by omake: https://github.com/ouonline/omake.git

CXX := g++

ifeq ($(debug), y)
	CXXFLAGS += -g
else
	CXXFLAGS += -O2 -DNDEBUG
endif

AR := ar

TARGET := libluacpp_shared.so libluacpp_static.a

.PHONY: all clean distclean

all: $(TARGET)

omake_dep_0_INCLUDE := -I../../../lua

omake_dep_0.luacpp.cpp.o: luacpp.cpp
	$(CXX) $(CXXFLAGS) -Wall -Werror -Wextra -fPIC $(omake_dep_0_INCLUDE) -c $< -o $@

luacpp_shared_OBJS := omake_dep_0.luacpp.cpp.o

luacpp_shared_LIBS := ../../../lua/src/liblua.a

libluacpp_shared.so: $(luacpp_shared_OBJS)
	$(CXX) $(CXXFLAGS) -fPIC -Wextra -Werror -Wall -shared -o $@ $^ $(luacpp_shared_LIBS)

luacpp_static_OBJS := omake_dep_0.luacpp.cpp.o

libluacpp_static.a: $(luacpp_static_OBJS)
	$(AR) rc $@ $^

clean:
	rm -f $(TARGET) $(luacpp_shared_OBJS) $(luacpp_static_OBJS)

distclean:
	$(MAKE) clean
