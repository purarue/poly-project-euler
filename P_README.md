# poly-project-euler

Solutions to [Project Euler](https://projecteuler.net), using distinct languages.

Run `make` in any directory to run.

Purpose for this is dependent on the language/problem. If its a language I'm familiar with, I'll implement it on my own, and try and look up related math to optimize. If its one I'm not, I'll try and learn the basics and implement something. If solutions for euler exist in that language, I'll may reference them to get a better understanding of the language.

---

```
>>>PMARK
#!/bin/bash
while IFS= read -r readme; do
  lang_ver="$(grep -m1 -oP 'Language: (.*)$' "${readme}" | sed -e 's/Language:\s*//')"
  lang_name="$(dirname "${readme}" | cut -d"-" -f2)"
  euler_prob="$(dirname "${readme}" | sed -e 's/[^0-9]*//g' | bc -l)"
  printf '* Problem \# %d: [`%s`](%s) (%s)\n' "${euler_prob}" "${lang_name}" "$(dirname "${readme}")" "${lang_ver}"
done < <(find . -mindepth 2 -name README.md | sort -n)
```

