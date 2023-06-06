#include "def.h"

void *memset(void *s, int val, unsigned int count)
{
	char *start = (char *)s;

	if(start == 0)
	{
		panic("NULL ptr\n");
	}

	while(count--)
	{
		*start++ = val;
	}

	return s;
}

void *memmove(char *dst, const char *src, int n)
{
	const char *s;
	char *d;

	if(n == 0)
	return dst;

	s = src;
	d = dst;
	if(s < d && s + n > d){
		s += n;
		d += n;
		while(n-- > 0)
		*--d = *--s;
	} else
	while(n-- > 0)
		*d++ = *s++;

	return dst;
}

void *memcpy(void *dst, const void *src, int n)
{
	return memmove(dst, src, n);
}

int strncmp(const char *p, const char *q, unsigned int n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (unsigned char)*p - (unsigned char)*q;
}


