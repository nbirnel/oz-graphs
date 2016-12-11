Oz Graphs
=========

Playing with data extraction and graphing of L. Frank Baum's Oz books.

Finding and Prepping the Texts
------------------------------
Assemble a canonical list_ of the Oz books. 

.. _list: ./intermediate/bibliography.txt

I followed Wikipedia's lead_.

.. _lead: https://en.wikipedia.org/wiki/List_of_Oz_books#The_original_and_canonical_Oz_books_by_L._Frank_Baum>

Create a download script for `Project Gutenberg`_ texts, and fetch them.

.. _Project Gutenberg: https://www.gutenberg.org/

.. code:: shell

 cd texts 
 ../code/get-texts   
 cd -

Clean the Project Gutenberg headers from the texts. 
Remove afterwards, the ends, etc. from the texts. 

.. code:: shell

 cd texts
 for i in * ; do 
     ../code/clean-gutenberg-headers $i \
     | ../code/clean-baum-tails \
     > ../intermediate/no_headers/"$i"
 done
 cd -


Break into chapters
-------------------

Confirm that we have the right idea for extracting chapters:

.. code:: shell

 cd intermediate/no-headers
 grep  -i -e '^chapter ' -e '^[0-9]\+\.' * | less
 cd -

At this point,
I realize that there was no point in cleaning anything before the first
chapter heading. 
No harm done.

Make chapters:
.. code:: shell
 cd intermediate/no_headers
 for i in * ; do
     base=$(basename $i .txt)
     mkdir ../chapters/$base
     (cd ../chapters/$base
      ../../../code/chapterize $OLDPWD/$i
     )
 done
 cd -
