CXXFLAGS = -static -O3 -g -Wall
LDFLAGS = 
LIBS = -lpthread -lrt -lurcu-qsbr
#export PKG_CONFIG_PATH = /path/to/my/liburcu/lib/pkgconfig

SRCS = main.cpp list.cpp

ALL = list_mutex list_rwlock list_rcu

all: $(ALL)

list_%: *.cpp *.hpp Makefile
	$(CXX) $(CXXFLAGS) $(DEFINES) -o $@ $(SRCS) $(LDFLAGS) $(LIBS)

list_mutex: DEFINES = -DUSE_MUTEX
list_rwlock: DEFINES = -DUSE_RWLOCK
list_rcu: DEFINES = -DUSE_RCU
list_rcu: CXXFLAGS += $(shell pkg-config --cflags liburcu-qsbr)
list_rcu: LIBS := $(shell pkg-config --libs liburcu-qsbr) $(LIBS)

clean:
	rm -f $(ALL)
