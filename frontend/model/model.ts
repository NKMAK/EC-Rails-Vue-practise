export interface LoginData {
  email: string;
  password: string;
}

export interface SignupData {
  name: string;
  email: string;
  password: string;
}

export interface ProductData {
  title: string;
  description: string;
  price: number;
  stock_quantity: number;
  active: boolean;
}
