export const signup = async () => {
  const response = await fetch("http://localhost:8000/up");
  console.log(response);
};
