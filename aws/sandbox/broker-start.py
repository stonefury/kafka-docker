import yaml
import argparse


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description="Create a Wordpress Site on Docker")
    parser.add_argument('-e', dest="env", type=str)
    # parser.add_argument('--rm', dest='remove', action='store_true')
    # parser.add_argument('--launch', dest='launch', action='store_true') # assume vols exist?
    # parser.add_argument('--dest', dest="destdir", type=str)

    args = parser.parse_args()

    import pdb
    pdb.set_trace()
    
    stream = file('fig.yml', 'r')
    obj = yaml.load(stream)
    import pdb
    pdb.set_trace()
    # obj['kafka']['environment']['KAFKA_ADVERTISED_HOST_NAME'] = "newvalue"


    ostream = file('newfig.yml', 'w')
    yaml.dump(obj,ostream)
# import pdb
# pdb.set_trace()

