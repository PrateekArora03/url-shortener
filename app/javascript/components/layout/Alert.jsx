import React from "react";

export default ({ message }) => {
  return (
    <div
      className="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
      role="alert"
    >
      <span className="block sm:inline">{message}</span>
    </div>
  );
};
