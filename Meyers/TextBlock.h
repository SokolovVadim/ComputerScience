#pragma once

#include <iostream>

class TextBlock {
public:
	TextBlock() :
		text("")
	{

	}

	const char& operator[](std::size_t position)const
	{
		std::cout << "I use operator[]!" << std::endl;
		return text[position];
	}
	/*char& operator[](std::size_t position)const
	{
	return
	const_cast<char&>
	(
	static_cast<const TextBlock&>(*this)[position]
	);
	}*/


private:
	char* text;
};


