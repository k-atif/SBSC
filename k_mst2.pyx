cimport numpy as np
cimport cython
# ctypedef np.int_t DTYPE_t

cpdef k_mst(int k, np.ndarray[np.int64_t, ndim=1] sorted_ws, np.ndarray[np.int32_t, ndim=1] us, np.ndarray[np.int32_t, ndim=1] vs, np.ndarray[np.float32_t, ndim=1] ws_2, np.ndarray[np.int32_t, ndim=1] parent, np.ndarray[np.int32_t, ndim=1] rank, np.ndarray[np.float32_t, ndim=2] result, int N):
    cdef unsigned long i, e, x, y, xroot, yroots
    i = 0
    e = 0 

    # ti = time.time()
    while e < N - 1 : 
        u, v, w = us[sorted_ws[i]], vs[sorted_ws[i]], ws_2[sorted_ws[i]] 
        # ti1 = time.time()
        x = u
        while x != parent[x]: 
            # path compression technique
            parent[x] = parent[parent[x]]
            x = parent[x]

        y = v
        while y != parent[y]: 
            # path compression technique
            parent[y] = parent[parent[y]]
            y = parent[y]

        if w != -1 and x != y: 
            result[e, 0], result[e, 1], result[e, 2] = u, v, w
            ws_2[sorted_ws[i]] = -1
            e = e + 1     
            xroot = x
            while xroot != parent[xroot]: 
                # path compression technique
                parent[xroot] = parent[parent[xroot]]
                xroot = parent[xroot] 

            yroot = y
            while yroot != parent[yroot]: 
                # path compression technique
                parent[yroot] = parent[parent[yroot]]
                yroot = parent[yroot]  
        
            if rank[xroot] < rank[yroot]: 
                parent[xroot] = yroot 
            elif rank[xroot] > rank[yroot]: 
                parent[yroot] = xroot 
            else : 
                parent[yroot] = xroot 
                rank[xroot] += 1
                
        i = i + 1