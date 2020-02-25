#include "Candy.h"
namespace swt {
	void PoolCandies::setPool()
	{
		for (std::size_t i(0); i < size_; ++i)
		{
			can_pool[i].setName();
			can_pool[i].setWeight();
		}
	}

	void PoolCandies::PrintPool()
	{
		for (std::size_t i(0); i < size_; ++i)
		{
			std::cout << "Candy[" << i << "]: ";
			can_pool[i].printCandy();
		}
		system("pause"); // pause to read printed message

	}
}