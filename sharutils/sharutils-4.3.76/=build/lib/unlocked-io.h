#ifndef UNLOCKED_IO_H
# define UNLOCKED_IO_H 1

# ifndef USE_UNLOCKED_IO
#  define USE_UNLOCKED_IO 1
# endif

# if USE_UNLOCKED_IO

/* These are wrappers for functions/macros from GNU libc.
   The standard I/O functions are thread-safe.  These *_unlocked ones are
   more efficient but not thread-safe.  That they're not thread-safe is
   fine since all of the applications in this package are single threaded.  */


# endif /* USE_UNLOCKED_IO */
#endif /* UNLOCKED_IO_H */
