#include <cstdlib>
#include <iostream>
#include <iterator>
#include <chrono>

#include <boost/multiprecision/mpfr.hpp>

namespace mp = boost::multiprecision;
using float_huge = mp::number<mp::mpfr_float_backend<PRECISION_DIGITS>>;
using timer_value_type = float;
using std::chrono::high_resolution_clock;

template <typename T>
struct scoped_timer
{
    scoped_timer(T& t) : t_(t), start_(high_resolution_clock::now()) { }
    ~scoped_timer()
    {
        t_ = std::chrono::duration<T,
           std::chrono::milliseconds::period>(high_resolution_clock::now() -
                   start_).count();
    }

    T& t_;
    high_resolution_clock::time_point start_;
};

float_huge pi_gauss_legendre()
{
    float_huge a = static_cast<float_huge>(1);
    float_huge b = static_cast<float_huge>(1) /
        mp::sqrt(static_cast<float_huge>(2));
    float_huge t = static_cast<float_huge>(.25);
    float_huge p = static_cast<float_huge>(1);

    for (int correct_digits = 3;
        correct_digits < std::numeric_limits<float_huge>::digits;
        correct_digits *= 2)
    {
        float_huge a_n = (a + b) / static_cast<float_huge>(2);
        b = mp::sqrt(a * b);
        t = t - p * mp::pow(a - a_n, static_cast<float_huge>(2));
        p = static_cast<float_huge>(2) * p;
        a = a_n;
    }

    float_huge pi = mp::pow(a + b, 2) / (static_cast<float_huge>(4) * t);

    return pi;
}

int main()
{
    timer_value_type t = 0;
    {
        scoped_timer<timer_value_type> timer(t);

        std::cout <<
            std::setprecision(std::numeric_limits<float_huge>::max_digits10)
            << "pi = " << pi_gauss_legendre() << '\n';
    }
    std::cout << "Gauss-Legendre took " << std::fixed << std::setprecision(4)
              << t << "(ms)\n";

    return 0;
}
/*
Partial Output (Windows, x64, Release, VC 15):
About to run Gauss-Legendre, t is 0(ms)
pi = 3.1415926535897932384626433832795028841971693993751058209749445923078164062...
Gauss-Legendre took 6674.4258(ms)
*/
