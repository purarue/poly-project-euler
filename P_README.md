# poly-project-euler

Solutions to [Project Euler](https://projecteuler.net), using distinct languages.

Run `make` in any directory to run.

```
>>>PMARK
#!/bin/bash
while IFS= read -r readme; do
  lang_ver="$(grep -m1 'Language:' "${readme}" | sed -e 's/\s*Language:\s*//')"
  lang_name="$(dirname "${readme}" | cut -d"-" -f2)"
  euler_prob="$(dirname "${readme}" | cut -d"-" -f1 | sed -e 's/[^0-9]*//g' | bc -l)"
  printf '%s [Problem \#%d](https://projecteuler.net/problem=%d): [`%s`](./%s/) (%s)\n' '-' "${euler_prob}" "${euler_prob}" "${lang_name}" "$(dirname "${readme}" | cut -d"/" -f2- | php -r 'echo urlencode(trim(fgets(STDIN)));')" "${lang_ver}"
done < <(find . -mindepth 2 -name README.md | sort -n)
```
