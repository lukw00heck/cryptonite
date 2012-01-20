# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Have to repeat libgcc.a and libgnustl_static.a so that they come after
# the other static libraries.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := libcryptonite
LOCAL_SRC_FILES := cryptonite.cpp android_key.cpp

LOCAL_C_INCLUDES := \
    ../encfs/encfs-1.7.4 \
    ../encfs/encfs-1.7.4/encfs \
    ../encfs/encfs-1.7.4/intl \
    ../fuse/fuse-android/jni/include \
    ../boost/boost_1_46_1 \
    ../rlog/rlog-1.4/armeabi/include \
    ../openssl/openssl-android/include

LOCAL_CPPFLAGS := \
    -D_FILE_OFFSET_BITS=64 \
    -DRLOG_COMPONENT="encfs" \
    -DFUSE_USE_VERSION=26 \
    -D__STDC_FORMAT_MACROS \
    -D__MULTI_THREAD \
    -DOPENSSL_NO_ENGINE \
    -DHAVE_EVP_AES \
    -DHAVE_EVP_BF \
    -DBOOST_FILESYSTEM_VERSION=2 \
    -fexceptions \
    -frtti

LOCAL_LDLIBS := \
    ./obj/local/armeabi/libencfs.a \
    ./obj/local/armeabi/libfuse.a \
    ./obj/local/armeabi/libboost_serialization.a \
    ./obj/local/armeabi/librlog.a \
    ./obj/local/armeabi/libboost_filesystem.a \
    ./obj/local/armeabi/libboost_system.a \
    ./obj/local/armeabi/libgnustl_static.a \
    ./obj/local/armeabi/libgcc.a \
    -L../openssl/openssl-android/libs/armeabi -lssl -lcrypto \
    -llog

include $(BUILD_SHARED_LIBRARY)
