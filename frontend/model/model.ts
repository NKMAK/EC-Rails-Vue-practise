export interface LoginData {
  email: string;
  password: string;
}

export interface SignupData {
  name: string;
  email: string;
  password: string;
}

export interface PostProductData {
  title: string;
  description: string;
  price: number;
  stock_quantity: number;
  active: boolean;
  images: File[];
}

export interface ProductImageData {
  id: number;
  product_id: number;
  image: {
    url: string;
  };
  display_order: number;
}

export interface GetProductData {
  id: number;
  title: string;
  description: string;
  price: string;
  stock_quantity: number;
  active: boolean;
  created_at: string;
  updated_at: string;
  product_images: ProductImageData[];
}
