#include <iostream>
#include <memory>
#include <string>
#include <vector>


#include "Templates.h"
#include "Rational.h"
#include "TMP.h"



int main()
{
	/*TextBlock block;
	char c = block[0];
	std::cout << "c = " << c << std::endl;

	int* b;
	b = new int;

	Widget w;
	w = w;
	std::tr1::shared_ptr<Widget> pw;*/

	//swt::PoolCandies pew	(3);

	//pew.setPool		();
	//pew.PrintPool	();


	int numbers = 11;
	std::string name = "VS";
	std::string className = "inf-mat";

	Derived<int> der(numbers, name);
	der.init(className);
	der.printData();


	Derived<std::string> cl("dvr", name);
	cl.printData();


	Rational<int> oneQuarter		(2, 4);
	Rational<int> oneHalf			(1, 2);

	Rational<int> result = oneQuarter * oneHalf;


	oneQuarter.printRational	();
	oneHalf.printRational		();
	result.printRational		();


	Factorial<5> fact;
	Factorial<8> fact1;

	fact.printAnswer();
	fact1.printAnswer();

	system("pause");

}
