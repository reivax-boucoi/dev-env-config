#include <iostream>
#include <string>
#include <external/lib.h>
#include <local/header.hpp>
#include "local2/header2.hpp"

namespace ns_1 { namespace ns_2 {

enum Enum { Enum_0 = 0, Enum_2 = 2, Enum_1 = 1 };
enum class ScopeEnum { _0, _1, _2 };
enum class ScopeEnumTyped : std::uint64_t { a_first_very_long_enumerator, a_second_very_long_enumerator };

class CEmpty {};
struct STag {};

/*
 * Indentation
 */

class Point
{
public:
    Point(double x, double y) :
            x(x), y(y)
    {
        std::cout << "hello" << std::endl;
    }

    double distance(const Point& other) const;
    int compareX(const Point& other) const;
    double x;
    double y;
};

double Point::distance(const Point& other) const
{
    double dx = x - other.x;
    double dy = y - other.y;

    return sqrt(dx * dx + dy * dy);
}

int Point::compareX(const Point& other) const
{
    if (x < other.x)
    {
        return -1;
    }
    else if (x > other.x)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

namespace FOO
{
int foo(int bar) const
{
    switch (bar)
    {
    case 0:
        ++bar;
        break;
    case 1:
        --bar;
    default:
    {
        bar += bar;
        break;
    }
    }
}
} // end namespace FOO

int digits[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

class MyClass: Base1, Base2
{
};

int a = 0, b = 1, c = 2, d = 3;

void foo() throw (E0, E1)
{
}
void bar(int x, int y) throw ()
{
}


label: for (int i = 0; i < argc; i++)
    goto label;



}}
