
#!/usr/bin/python3
import sys
lazy_paginate_module = __import__('2-lazy_paginate')
lazy_paginate = lazy_paginate_module.lazy_paginate

try:
    for page in lazy_paginate(100):
        for user in page:
            print(user)

except BrokenPipeError:
    sys.stderr.close()
