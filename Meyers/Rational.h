#pragma once
#include <iostream>

template <typename T> class Rational;

template <typename T> 
const Rational<T> doMultiply(const Rational<T> & lhs,
							 const Rational<T> & rhs);


template <typename T>
class Rational
{
public:


	Rational(const T & numerator, const T & denominator);

	const T numerator() const
	{
		return _numerator;
	}
	const T denominator() const
	{
		return _denominator;
	}

	void printRational()
	{
		std::cout << "Numerator:\t"	  << _numerator   << std::endl;
		std::cout << "Denominator:\t" << _denominator << std::endl;
	}


	friend
		const Rational operator* (const Rational<T> & lhs,
								  const Rational<T> & rhs)
	{
		return doMultiply(lhs, rhs);
	}

private:

	T _numerator;
	T _denominator;
};

template <typename T>
Rational<T>::Rational(const T & numerator, const T & denominator) :
	_numerator(numerator),
	_denominator(denominator)
{}


template <typename T>
const Rational<T> doMultiply(const Rational<T> & lhs,
	const Rational<T> & rhs)
{
	return Rational<T>(lhs.numerator() * rhs.numerator(),
		lhs.denominator() * rhs.denominator());
}


