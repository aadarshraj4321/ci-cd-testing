/** @type {import('next').NextConfig} */
const nextConfig = {
    // Ensuring the app binds to all interfaces for external access
    webpack(config, { isServer }) {
      if (isServer) {
        // Ensure Next.js listens on all network interfaces (0.0.0.0)
        config.devServer.host = '0.0.0.0';
      }
      return config;
    }
  };
  
  export default nextConfig;
  