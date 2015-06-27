/*
Coursera HW/SW Interface
Lab 4 - Mystery Caches

Mystery Cache Geometries (for you to keep notes):
mystery0:
    block size = 64 Bytes
    cache size = 4096 Bytes
    associativity = 32
mystery1:
    block size = 8 Bytes
    cache size = 8192 Bytes
    associativity = 8
mystery2:
    block size = 32 Bytes
    cache size = 32768 Byte
    associativity = 2
mystery3:
    block size = 16 Bytes
    cache size = 4096 Bytes
    associativity = 1
*/

#include <stdlib.h>
#include <stdio.h>

#include "mystery-cache.h"

/*
 * NOTE: When using access_cache() you do not need to provide a "real"
 * memory addresses. You can use any convenient integer value as a
 * memory address, you should not be able to cause a segmentation
 * fault by providing a memory address out of your programs address
 * space as the argument to access_cache.
 */

/*
   Returns the size (in B) of each block in the cache.
*/
int get_block_size(void) {
  /* YOUR CODE GOES HERE */
  int block_size = 0;
  flush_cache();
  // accessed the cache ...its miss and 
  // the whole block will be loaded into cache
  // hence the we will get hit for all the 
  // memory values until we get query till the size of the
  // block
  access_cache(block_size++);
  while(access_cache(block_size)){
  	block_size++;
  }
  return (block_size);
}

/*
   Returns the size (in B) of the cache.
*/
int get_cache_size(int block_size) {
  /* YOUR CODE GOES HERE */
    int i=0;
	int cache_check=block_size;
	flush_cache();
	access_cache(i);
	while(access_cache(0)){
		i=block_size;
		while(i<=cache_check){
			i+=block_size;
			access_cache(i);
		}
		cache_check +=block_size;
	}	
  return i;
}

/*
   Returns the associativity of the cache.
*/
int get_cache_assoc(int size) {
  /* YOUR CODE GOES HERE */
    int i=0;
	int cache_check=1;
	int assoc=0;
	flush_cache();
	access_cache(i);
	while(access_cache(0)){
		i=size;
		assoc=0;
		while(i<=cache_check){
			i+=size;
			++assoc;
			access_cache(i);
		}
		cache_check +=size;
	}	
  return assoc;
}

//// DO NOT CHANGE ANYTHING BELOW THIS POINT
int main(void) {
  int size;
  int assoc;
  int block_size;

  /* The cache needs to be initialized, but the parameters will be
     ignored by the mystery caches, as they are hard coded.  You can
     test your geometry paramter discovery routines by calling
     cache_init() w/ your own size and block size values. */
  cache_init(0,0);

  block_size=get_block_size();
  size=get_cache_size(block_size);
  assoc=get_cache_assoc(size);

  printf("Cache block size: %d bytes\n", block_size);
  printf("Cache size: %d bytes\n", size);
  printf("Cache associativity: %d\n", assoc);

  return EXIT_SUCCESS;
}
