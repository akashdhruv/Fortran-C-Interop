#ifndef FARRAY_H
#define FARRAY_H

#include <cstddef>
 
template <typename T>
struct FArray1D {
    size_t ni;
    T* data;
    bool ownsData;

    // Constructor to allocate memory
    FArray1D(size_t ni)
        : ni(ni), data(new T[ni]), ownsData(true) {}

    // Constructor to use existing Fortran array
    FArray1D(T* fortranArray, size_t ni)
        : ni(ni), data(fortranArray), ownsData(false) {}

    // Destructor to free memory
    ~FArray1D() {
        if (data != nullptr && ownsData) {
            delete[] data;
        }
    }

    // Access operator
    T& operator()(size_t i) {
        return data[i];
    }

    // Const access operator
    const T& operator()(size_t i) const {
        return data[i];
    }

    // Method to attach an existing Fortran array
    void attach(T* fortranArray) {
        data = fortranArray;
        ownsData = false;
    }
};


template <typename T>
struct FArray2D {
    size_t ni, nj;
    T* data;
    bool ownsData;

    // Constructor to allocate memory
    FArray2D(size_t ni, size_t nj)
        : ni(ni), nj(nj), data(new T[ni * nj]), ownsData(true) {}

    // Constructor to use existing Fortran array
    FArray2D(T* fortranArray, size_t ni, size_t nj)
        : ni(ni), nj(nj), data(fortranArray), ownsData(false) {}

    // Destructor to free memory
    ~FArray2D() {
        if (data != nullptr && ownsData) {
            delete[] data;
        }
    }

    // Access operator
    T& operator()(size_t i, size_t j) {
        return data[i + ni * j];
    }

    // Const access operator
    const T& operator()(size_t i, size_t j) const {
        return data[i + ni * j];
    }

    // Method to attach an existing Fortran array
    void attach(T* fortranArray) {
        data = fortranArray;
        ownsData = false;
    }
};


template <typename T>
struct FArray3D {
    size_t ni, nj, nk;
    T* data;
    bool ownsData;

    // Constructor to allocate memory
    FArray3D(size_t ni, size_t nj, size_t nk)
        : ni(ni), nj(nj), nk(nk), data(new T[ni * nj * nk]), ownsData(true) {}

    // Constructor to use existing Fortran array
    FArray3D(T* fortranArray, size_t ni, size_t nj, size_t nk)
        : ni(ni), nj(nj), nk(nk), data(fortranArray), ownsData(false) {}

    // Destructor to free memory
    ~FArray3D() {
        if (data != nullptr && ownsData) {
            delete[] data;
        }
    }

    // Access operator
    T& operator()(size_t i, size_t j, size_t k) {
        return data[i + ni * (j + nj * k)];
    }

    // Const access operator
    const T& operator()(size_t i, size_t j, size_t k) const {
        return data[i + ni * (j + nj * k)];
    }

    // Method to attach an existing Fortran array
    void attach(T* fortranArray) {
        data = fortranArray;
        ownsData = false;
    }
};

#endif
