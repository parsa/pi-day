#include <cstdlib>
#include <iostream>
#include <iterator>
#include <chrono>

#include <boost/multiprecision/cpp_dec_float.hpp>

namespace mp = boost::multiprecision;
using float_huge = mp::number<mp::cpp_dec_float<14'368>>;

using timer_t = long long;
using std::chrono::high_resolution_clock;

struct scoped_timer
{

    scoped_timer(timer_t& t) : t_(t), start_(high_resolution_clock::now()) { }
    ~scoped_timer()
    {
        high_resolution_clock::time_point end = high_resolution_clock::now();
        auto diff = end - start_;
        t_ = std::chrono::duration_cast<std::chrono::milliseconds>(diff).count();
    }

    timer_t& t_;
    high_resolution_clock::time_point start_;
};

float_huge pi_gauss_legendre()
{
    float_huge a = static_cast<float_huge>(1);
    float_huge b = static_cast<float_huge>(1) / mp::sqrt(static_cast<float_huge>(2));
    float_huge t = static_cast<float_huge>(.25);
    float_huge p = static_cast<float_huge>(1);

    for (std::size_t i = 0; i < 1; ++i)
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
    timer_t t = 0;
    {
        scoped_timer timer(t);
        std::cout << "About to run Gauss-Legendre, t is " << t << "(ms)\n";

        std::cout << std::setprecision(std::numeric_limits<float_huge>::max_digits10)
            << "pi = " << pi_gauss_legendre() << '\n';
    }
    std::cout << "Gauss-Legendre took " << t << "(ms)\n";

    return 0;
}
