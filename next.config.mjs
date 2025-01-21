/** @type {import('next').NextConfig} */
const nextConfig = {
    webpack(config, { isServer, dev }) {
      if (dev && isServer) {
        // This ensures that Next.js listens on 0.0.0.0 only during development
        config.devServer.host = '0.0.0.0';
      }
      return config;
    }
  };
  
  export default nextConfig;
  