macro malloc [arg]
{
  argc = 0
forward
  if ~arg eq
    argc = argc+1
  end if
common
  if argc = 1
    invoke  HeapAlloc, [hHeap], 0, arg
  else if argc = 2
    match count, size, arg
    \{
        invoke HeapAlloc, [hHeap], 8, count * size
      \}
  end if
}