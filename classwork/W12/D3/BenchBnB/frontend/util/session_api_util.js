export const signup = (data) => {
    return $.ajax({
          url: '/api/users',
          method:'POST',
          data, 
    })
};

export const login = (data) => {
  return $.ajax({
    url: '/api/session',
    method: 'POST',
    data, 
  })
};

export const logout = () => {
  return $.ajax({
    url: `/api/session`,
    method: 'DELETE'
  })
};