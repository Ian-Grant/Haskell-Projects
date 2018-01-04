#include <iostream>
#ifndef BST_H
#define BST_H

using namespace std;

class BST
{
	public:
		BST();
		BST(const BST& other);
		BST& operator=(const BST& other);
		~BST();

		void insert(const int& newData);
		void clear();
		void showStructure() const;
        void writeKeys() const;
		void writeKeysLessThan(const int& searchKey) const;
		bool retrieve(const int& searchKey, int& newDataItem);
		bool remove(const int& searchKey);
		bool isEmpty() const;
		int getHeight() const;
		int getCount() const;
	protected:
		class Node
		{
			public:
				Node(const int& nodeDataItem, Node* leftPtr, Node* rightPtr);
				int data;
				Node *left, *right;
		};

		void showHelper(Node* p, int level) const;
		void copyHelper(Node*& p, Node* src);
	    void clearHelper(Node*& p);
		void insertHelper(Node*& p, const int& newData);
		void writeKeysHelper(Node* p) const;
		void writeKeysLessThanHelper(Node* p, const int& searchKey) const;
		int getCountHelper(Node* p) const;
		int getHeightHelper(Node* p) const;
		bool removeHelper(Node*& p, const int& searchKey);
		bool retrieveHelper(Node* p, const int& searchKey, int& searchDataItem) const;

		Node* root;
};

#endif
