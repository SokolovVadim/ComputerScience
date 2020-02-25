#pragma once

#include <iostream>

template <typename T>
class Base
{
public:
	Base();
	Base					(const T & cont, const std::string & name);
	virtual void init		(T cont);
	inline virtual void printData	();
	virtual		 ~Base		();

private:

	T _cont;
	std::string _name;
};

template <typename T>
class Derived: public Base<T> {
	//typedef Base<T> Type;

public:
	Derived				(const T & cont, const std::string & name);
	void init			(const std::string & className);
	~Derived();
private:
	std::string _className;
};



template <typename T>
Base<T>::Base()
{
	std::cout << "Base constructor" << std::endl;
}

template <typename T>
Base<T>::Base(const T & cont, const std::string & name) :
	_cont(cont),
	_name(name)
{
	std::cout << "Base has constructed!" << std::endl;
}

template <typename T>
void Base<T>::init(T cont)
{
	_cont = cont;
}


template <typename T>
inline void Base<T>::printData()
{
	std::cout << "name: " << _name << std::endl;
	std::cout << "cont: " << _cont << std::endl;
}


template <typename T>
Base<T>::~Base()
{
	std::cout << "Base has destructed!" << std::endl;
	//system("pause");
}



template <typename T>
void Derived<T>::init(const std::string & className)
{
	_className = className;
}

template <typename T>
Derived<T>::Derived(const T & cont, const std::string & name) :
	Base(cont, name)
{
	std::cout << "Derived has constructed!" << std::endl;
}

template <typename T>
Derived<T>::~Derived()
{
	std::cout << "Derived has destructred!" << std::endl;
}


