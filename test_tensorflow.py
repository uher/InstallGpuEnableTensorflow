import tensorflow as tf

sess = tf.Session()


hello_world = tf.constant("Hello, TensorFlow!")
print sess.run(hello_world)

print sess.run(tf.constant(123)*tf.constant(456))

