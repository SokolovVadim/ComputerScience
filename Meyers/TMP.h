#pragma once
//---------------------------------------------------------------
// templates multiprogramming
// Effective C++ by S. Meyers realisation
// Sokolov Vadim, 08.13.2018
//---------------------------------------------------------------

#include <iostream>

template <unsigned n>
struct Factorial {
	
	void printAnswer();
	
	enum { value = n*Factorial<n - 1>::value };
};

template<>
struct Factorial<0> {
	enum { value = 1 };
};

template<typename unsigned n>
void Factorial<n>::printAnswer()
{
	std::cout << n << "! = " << value << std::endl;
}

