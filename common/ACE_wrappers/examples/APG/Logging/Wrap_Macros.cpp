// $Id: Wrap_Macros.cpp 80826 2008-03-04 14:51:23Z wotte $

#include "Trace.h"

#if defined (__GNUC__) && (__GNUC__ >= 3 || __GNUC_MINOR__ > 95) && \
    (!defined (VXWORKS) || !(__GNUC__ == 2 && __GNUC_MINOR__ == 96))
// The macros in Trace.h only work on g++ 2.96 and later.
// But not with VxWorks g++ 2.96.

// Listing 1 code/ch03
void foo (void);

int ACE_TMAIN (int, ACE_TCHAR *[])
{
  ACE_TRACE ("main");
  MY_DEBUG (ACE_TEXT ("Hi Mom\n"));
  foo ();
  MY_DEBUG (ACE_TEXT ("Goodnight\n"));
  return 0;
}

void foo (void)
{
  ACE_TRACE ("foo");
  MY_DEBUG (ACE_TEXT ("Howdy Pardner\n"));
}
// Listing 1

#else
#include "ace/OS_NS_stdio.h"

int ACE_TMAIN (int, ACE_TCHAR *[])
{
  ACE_OS::puts ("This example only works on g++ 2.96 and later.\n");
  return 0;
}

#endif /* __GNUC__ */
