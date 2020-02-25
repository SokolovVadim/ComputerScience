#pragma once

#include <iostream>
#include "string"


namespace swt {

	struct Candy
	{
		Candy() :
			name_(std::string()),
			weight_(0.0)
		{}

		void setName()
		{
			std::cout << "Set name: ";
			std::getline(std::cin, name_);
		}

		void setWeight()
		{
			std::cout << "Set weight: ";
			std::cin >> weight_;
			std::cin.get();
		}

		void printCandy()
		{
			std::cout << "name: " << name_ << ",\tweight: " << weight_ << std::endl;
		}

		std::string			name_;
		double				weight_;
	};


	struct PoolCandies
	{
		PoolCandies(std::size_t size) :
			can_pool(new Candy[size]),
			size_(size)
		{}

		void setPool();


		void PrintPool();

		~PoolCandies()
		{
			size_ = 0;
			delete[] can_pool;
		}


		Candy * can_pool;
		std::size_t size_;

	};

}